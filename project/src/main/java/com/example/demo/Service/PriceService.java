package com.example.demo.Service;

import com.example.demo.Models.Price;
import com.example.demo.Repository.PriceRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
@Slf4j
public class PriceService {

    private final PriceRepo priceRepository;

    public List<Price> getAllPrice(){
        return priceRepository.findAll();
    }
}
