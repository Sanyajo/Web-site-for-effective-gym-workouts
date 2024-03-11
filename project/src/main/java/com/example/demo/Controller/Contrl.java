package com.example.demo.Controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class Contrl {

    @GetMapping("/SportStorm")
    public String MainF(){
        return "main";
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