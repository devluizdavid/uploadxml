package br.org.ccee.upload.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.util.Date;
import java.util.List;


@Data
public class AgenteDto {

    @JsonProperty("codigo")
    private String codigo;

    @JsonProperty("data")
    @JsonSerialize(using = DateJsonSerializer.class)
    private Date data;

    @JsonProperty("regiao")
    private List<RegiaoDto> regiao;


    public AgenteDto(@JsonProperty("codigo") String codigo, @JsonProperty("data") Date data, @JsonProperty("regiao") List<RegiaoDto> regiao) {
        this.codigo = codigo;
        this.data = data;
        this.regiao = regiao;
    }


}
