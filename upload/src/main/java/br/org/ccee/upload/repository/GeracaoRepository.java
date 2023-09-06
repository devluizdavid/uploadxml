package br.org.ccee.upload.repository;

import br.org.ccee.upload.model.Geracao;
import br.org.ccee.upload.model.Regiao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface GeracaoRepository extends JpaRepository<Geracao, Integer> {


}
