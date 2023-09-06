package br.org.ccee.upload.service;

import br.org.ccee.upload.dto.AgenteDto;
import br.org.ccee.upload.model.Agente;
import br.org.ccee.upload.repository.AgenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AgenteService {

    @Autowired
    private AgenteRepository agenteRepository;


    public Agente create(AgenteDto agenteDto) {
        Agente agente = convertToEntity(null, agenteDto);
        return agenteRepository.save(agente);
    }

    private Agente convertToEntity(Agente agente, AgenteDto agenteDto)   {
        if (agente == null) agente = new Agente();
        agente.setCodigo(agenteDto.getCodigo());
        agente.setData(agenteDto.getData());
        return agente;
    }

}
