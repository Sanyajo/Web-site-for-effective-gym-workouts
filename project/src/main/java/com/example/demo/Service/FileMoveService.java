package com.example.demo.Service;

import com.example.demo.Repository.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import com.example.demo.Models.User;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.CompletableFuture;

@Service
@Slf4j
@RequiredArgsConstructor
public class FileMoveService {

    private final UserRepo userRepo;

    @Async
    public CompletableFuture<Void> moveFile(User user, MultipartFile file, String destination) {
        try {
            Path directory = Paths.get(destination);

            if (!Files.exists(directory)) {
                Files.createDirectories(directory); // Создаем директорию, если ее нет
            }

            // Создаем путь для файла в целевой директории
            Path filePath = directory.resolve(file.getOriginalFilename());

            // Проверяем существует ли файл в целевой директории
            if (!Files.exists(filePath)) {
                // Создаем путь для временного файла
                Path tempFilePath = Files.createTempFile(directory, "temp", null);

                // Записываем данные из MultipartFile во временный файл
                Files.write(tempFilePath, file.getBytes());

                // Перемещаем временный файл в целевую директорию
                Files.move(tempFilePath, filePath);
            }

            // Обновляем URL аватара и сохраняем пользователя
            String urlAvatar = "/usersAvatar/" + file.getOriginalFilename();
            user.setAvatar(urlAvatar);
            userRepo.save(user);

            return CompletableFuture.completedFuture(null);
        } catch (IOException ex) {
            ex.printStackTrace();
            return CompletableFuture.failedFuture(ex);
        }
    }

}
