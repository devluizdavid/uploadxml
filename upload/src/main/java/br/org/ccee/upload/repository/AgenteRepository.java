package br.org.ccee.upload.repository;

import br.org.ccee.upload.model.Agente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AgenteRepository extends JpaRepository<Agente, Integer> {

}
