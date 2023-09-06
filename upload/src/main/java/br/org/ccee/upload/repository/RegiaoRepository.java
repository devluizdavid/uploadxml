package br.org.ccee.upload.repository;

import br.org.ccee.upload.model.Regiao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RegiaoRepository extends JpaRepository<Regiao, Integer> {


    List<Regiao> findBySigla(String sigla);
}
