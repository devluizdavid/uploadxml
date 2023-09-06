package br.org.ccee.upload.service;


import br.org.ccee.upload.dto.GeracaoDto;
import br.org.ccee.upload.dto.PrecoMedioDto;
import br.org.ccee.upload.model.Compra;
import br.org.ccee.upload.model.PrecoMedio;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.repository.GeracaoRepository;
import br.org.ccee.upload.repository.PrecoMedioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class PrecoMedioService {

    @Autowired
    private PrecoMedioRepository precoMedioRepository;

    public void createAll(Regiao regiao, PrecoMedioDto precoMedio) {
        for (BigDecimal valor : precoMedio.getValor()) {
            precoMedioRepository.save(new PrecoMedio(null, valor, regiao , regiao.getAgente()));
        }
    }
}
