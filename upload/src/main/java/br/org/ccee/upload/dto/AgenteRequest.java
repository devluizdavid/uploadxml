package br.org.ccee.upload.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class AgenteRequest {

    @JsonProperty("versao")
    private String versao;

    @JsonProperty("agente")
    private List<AgenteDto> agente;

    public AgenteRequest(@JsonProperty("versao") String versao, @JsonProperty("agente") List<AgenteDto> agenteDto) {
        this.versao = versao;
        this.agente = agenteDto;
    }
}
