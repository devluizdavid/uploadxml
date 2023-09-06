package br.org.ccee.upload.controller;

import br.org.ccee.upload.dto.AgenteRequest;
import br.org.ccee.upload.model.Agente;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.service.AgenteService;
import br.org.ccee.upload.service.RegiaoService;
import com.fasterxml.jackson.dataformat.xml.JacksonXmlModule;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/regiao")
public class RegiaoController {

    @Autowired
    private RegiaoService regiaoService;

    @GetMapping(value = "/{sigla}")
    public ResponseEntity<List<Regiao>> findById(@PathVariable String sigla) {
        List<Regiao> regioes = regiaoService.findBySigla(sigla);
        if (regioes == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(regioes);
    }
}
