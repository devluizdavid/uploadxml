package br.org.ccee.upload.repository;

import br.org.ccee.upload.model.Regiao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RegiaoRepository extends JpaRepository<Regiao, String> {


    void deleteBySigla(String sigla);

    Optional<Regiao> findBySigla(String sigla);
}
