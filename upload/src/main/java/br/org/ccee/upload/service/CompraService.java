package br.org.ccee.upload.service;


import br.org.ccee.upload.dto.CompraDto;
import br.org.ccee.upload.dto.GeracaoDto;
import br.org.ccee.upload.model.Compra;
import br.org.ccee.upload.model.Geracao;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.repository.CompraRepository;
import br.org.ccee.upload.repository.GeracaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class CompraService {

    @Autowired
    private CompraRepository compraRepository;

    public void createAll(Regiao regiao, CompraDto compra) {
        for (BigDecimal valor : compra.getValor()) {
            compraRepository.save(new Compra(null, valor, regiao , regiao.getAgente()));
        }
    }

}
