package com.example.demo.Controller;

import com.example.demo.Service.AboutUsService;
import com.example.demo.Service.AllTraningProgramService;
import com.example.demo.Service.PriceService;
import com.example.demo.Service.SliderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@Controller
@RequiredArgsConstructor
public class Contrl {

    private final SliderService sliderService;
    private final AllTraningProgramService traningProgramService;
    private final AboutUsService aboutUsService;
    private final PriceService priceService;

    @GetMapping("/main")
    public String redirectMainPage(){
        return "redirect:/SportStorm";
    }

    @GetMapping("/SportStorm")
    public String mainPage(Model model){
        model.addAttribute("listSliderHead", sliderService.getSliderByType("mainWindHead"));
        model.addAttribute("progrList", traningProgramService.getAllTraningProgram());
        model.addAttribute("aboutuslist", aboutUsService.getAllAboutUs());
        model.addAttribute("priceList", priceService.getAllPrice());
        return "main";
    }


    @GetMapping("/traningProgram")
    public String redirectTraningProgram(Model model){
        return "redirect:/traning-program";
    }

    @GetMapping("/traning-program")
    public String traningProgram(Model model){
        model.addAttribute("progrList", traningProgramService.getAllTraningProgram());
        return "traningprogram";
    }


}


//
//    private void fetchAndInjectHeaderHTML(Model model) {
//        try {
//            // Загрузка ресурса из класспаса (src/main/resources)
//            Resource resource = new ClassPathResource("templates/header.html");
//
//            // Чтение содержимого файла в строку
//            String htmlContent = StreamUtils.copyToString(resource.getInputStream(), Charset.defaultCharset());
//
//            // Добавление HTML-кода в модель
//            model.addAttribute("htmlContentHeader", htmlContent);
//        } catch (IOException e) {
//            // Обработка ошибок, если не удается прочитать файл
//            e.printStackTrace();
//            model.addAttribute("htmlContentHeader", "<p>Error loading HTML(Header) content</p>");
//        }
//    }
//    private void fetchAndInjectFooterHTML(Model model) {
//        try {
//            Resource resource = new ClassPathResource("templates/footer.html");
//            String htmlContent = StreamUtils.copyToString(resource.getInputStream(), Charset.defaultCharset());
//            model.addAttribute("htmlContentFooter", htmlContent);
//        } catch (IOException e) {
//            e.printStackTrace();
//            model.addAttribute("htmlContentFooter", "<p>Error loading Html(Footer) content</p>");
//        }
//    }
//}