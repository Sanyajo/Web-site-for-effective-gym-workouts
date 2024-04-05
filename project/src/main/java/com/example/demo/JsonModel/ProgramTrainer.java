package com.example.demo.JsonModel;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "trainName",
        "kollpodh"
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProgramTrainer {

    @JsonProperty("trainName")
    private String trainName;

    @JsonProperty("kollpodh")
    private String kollpodh;

}