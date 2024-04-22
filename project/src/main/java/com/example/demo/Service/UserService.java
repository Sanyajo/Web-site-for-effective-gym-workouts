package com.example.demo.Service;

import com.example.demo.JsonModel.Program;
import com.example.demo.JsonModel.ProgramTrainer;
import com.example.demo.Models.User;
import com.example.demo.Models.enums.Role;
import com.example.demo.Repository.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepo userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JsonService jsonService;

    @Autowired
    private FileMoveService fileMoveService;

    public boolean createUser(User user){
        String userEmail = user.getEmail();
        String userName = user.getUsername();
        if(userRepository.findByEmail(userEmail) != null || userName == null || userRepository.findByName(userName) != null || user.getPassword().length() < 4){
            return false;
        }
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Пользователь с почтой " + userEmail + " создан !");
        userRepository.save(user);
        return true;
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void addLastTraning(User user, String programName){
        String[] programList = user.getLastProgramArray();
        String[] newProgramList = new String[programList.length + 1];
        System.arraycopy(programList, 0, newProgramList, 0, programList.length);
        newProgramList[newProgramList.length - 1] = programName;
        user.setLastProgramArray(newProgramList);
        userRepository.save(user);
    }

    public int getCountTraining(User user){
        String[] programList = user.getLastProgramArray();
        return programList.length;
    }

    public int[] getCountRepeat(User user) throws IOException {
        int countRepeat = 0;
        int countApproaches = 0;
        List<String> programNames = Arrays.asList(user.getLastProgramArray());

        for (String program : programNames) {
            String[] programName = program.split(" ");
            Program[] programs = jsonService.getProgram(programName[1]);

            for (Program pr : programs) {
                if (pr.getProgrName().equals(program)) {
                    for (var arr : pr.getProgrTraner()) {
                        Pattern pattern = Pattern.compile("\\d+");
                        Matcher matcher = pattern.matcher(arr.getKollpodh());

                        int counter = 1;
                        while (matcher.find()) {
                            String number = matcher.group();
                            int num = Integer.parseInt(number);
                            if(counter == 1){
                                countRepeat += num;
                            }else{
                                countApproaches +=num;
                            }
                            counter++;
                        }
                    }
                }
            }
        }
        return new int[] {countRepeat, countApproaches};
    }

    public Map<String, Object> renameUser(User user, String userName) {
        Map<String, Object> response = new HashMap<>();
        try {
            if (userName == null || userRepository.findByName(userName) != null) {
                response.put("success", false);
                response.put("message", "Пользователь с таким именем уже существует!");
            } else {
                String oldName = user.getName();
                user.setName(userName);
                userRepository.save(user);
                response.put("success", true);
                response.put("message", "Имя пользователя " + oldName + " успешно изменено на " + user.getName());
            }
        } catch (Exception ex) {
            response.put("success", false);
            response.put("message", "Ошибка: " + ex.getMessage());
        }
        return response;
    }

    public void changeUserPassword(User user, String newUserPassword){
        if(newUserPassword != null && user != null){
            user.setPassword(passwordEncoder.encode(newUserPassword));
            userRepository.save(user);
            log.info("Пароль пользователя " + user.getName() + " успешно поменян !");
        }else{
            log.info("Пароль пользователя " + user.getName() + " не поменян !");
        }
    }

    public void changeUserAvatar(User user, MultipartFile images) throws IOException {
// В вашем методе
        if (images != null && user != null) {
            Future<Void> moveResult = fileMoveService.moveFile(user, images, "/Users/sangao/Documents/Github/Web-site-for-effective-gym-workouts/project/src/main/resources/static/usersAvatar");

            // Вы можете проверить результат перемещения файла, если это необходимо
        }

    }




}
