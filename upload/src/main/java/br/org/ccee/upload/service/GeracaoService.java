package br.org.ccee.upload.service;


import br.org.ccee.upload.dto.GeracaoDto;
import br.org.ccee.upload.model.Geracao;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.repository.GeracaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class GeracaoService {

    @Autowired
    private GeracaoRepository geracaoRepository;

    public void createAll(Regiao regiao, GeracaoDto geracao) {
        for (BigDecimal valor : geracao.getValor()) {
            geracaoRepository.save(new Geracao(null, valor, regiao, regiao.getAgente() ));
        }
    }
}
