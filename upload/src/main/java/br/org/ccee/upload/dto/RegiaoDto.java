package br.org.ccee.upload.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


@Data
public class RegiaoDto {

    @JsonProperty("sigla")
    private String sigla;

    @JsonProperty("geracao")
    private GeracaoDto geracao;

    @JsonProperty("compra")
    private CompraDto compra;

    @JsonProperty("precoMedio")
    private PrecoMedioDto precoMedio;

    public RegiaoDto(@JsonProperty("sigla") String sigla,
                     @JsonProperty("geracao") GeracaoDto  geracaoDto,
                     @JsonProperty("compra") CompraDto compraDto,
                     @JsonProperty("precoMedio") PrecoMedioDto precoMedioDto) {
        this.sigla = sigla;
        this.geracao = geracaoDto;
        this.compra = compraDto;
        this.precoMedio = precoMedioDto;
    }
}
