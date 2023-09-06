package br.org.ccee.upload.service;

import br.org.ccee.upload.dto.RegiaoDto;
import br.org.ccee.upload.model.Agente;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.repository.RegiaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegiaoService {

    @Autowired
    private RegiaoRepository regiaoRepository;


    @Autowired
    private GeracaoService geracaoService;

    @Autowired
    private PrecoMedioService precoMedioService;

    @Autowired
    private CompraService compraService;

    public void create(Agente agente, RegiaoDto regiaoDto) {
        Regiao regiao = new Regiao();
        regiao.setAgente(agente);
        regiao.setSigla(regiaoDto.getSigla());
        regiao = regiaoRepository.save(regiao);

        geracaoService.createAll(regiao, regiaoDto.getGeracao());
        precoMedioService.createAll(regiao, regiaoDto.getPrecoMedio());
        compraService.createAll(regiao, regiaoDto.getCompra());
    }


    public List<Regiao> findBySigla(String sigla) {
        return regiaoRepository.findBySigla(sigla);
    }
}
