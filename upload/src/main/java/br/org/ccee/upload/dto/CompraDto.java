package br.org.ccee.upload.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Data
public class CompraDto {

    private List<BigDecimal> valor;
}
