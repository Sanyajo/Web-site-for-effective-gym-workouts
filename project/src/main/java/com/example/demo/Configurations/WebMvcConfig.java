package com.example.demo.Configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Добавляем обработчик для статических ресурсов из нового расположения файла
        registry.addResourceHandler("/usersAvatar/**")
                .addResourceLocations("file:/Users/sangao/Documents/Github/Web-site-for-effective-gym-workouts/project/src/main/resources/static/usersAvatar/");
    }
}
