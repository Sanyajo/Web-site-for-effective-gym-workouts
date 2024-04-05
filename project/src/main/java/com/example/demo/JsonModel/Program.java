package com.example.demo.JsonModel;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "progrName",
        "progrTraner",
        "progrInfo"
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Program {

    @JsonProperty("progrName")
    private String progrName;

    @JsonProperty("progrTraner")
    private List<ProgramTrainer> progrTraner;

    @JsonProperty("progrInfo")
    private String progrInfo;

}