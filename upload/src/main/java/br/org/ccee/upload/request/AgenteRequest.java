package br.org.ccee.upload.request;

import br.org.ccee.upload.dto.AgenteDto;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@JsonRootName("agentes")
public class AgenteRequest {

    private AgenteDto agentes;

}
