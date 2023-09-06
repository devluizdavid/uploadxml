package br.org.ccee.upload.controller;

import br.org.ccee.upload.dto.*;
import br.org.ccee.upload.model.Agente;
import br.org.ccee.upload.model.Regiao;
import br.org.ccee.upload.service.*;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.dataformat.xml.JacksonXmlModule;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping(value = "/agente")
public class AgenteController {

    @Autowired
    private AgenteService agenteService;

    @Autowired
    private RegiaoService regiaoService;


/*
    @GetMapping
    public ResponseEntity<List<Agente>> findAll() {
        List<Agente> agentes = agenteService.findAll();
        if (agentes == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return ResponseEntity.ok(agentes);
    }


    @GetMapping(value = "/{agenteId}")
    public ResponseEntity<Agente> findById(@PathVariable Integer agenteId) {
        Optional<Agente> agente = agenteService.findById(agenteId);
        if (!agente.isPresent())  return ResponseEntity.notFound().build();
        return ResponseEntity.ok(agente.get());
    }

 */
  @PostMapping
    public void uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            byte[] fileBytes = file.getBytes();
            String fileContent = new String(fileBytes, StandardCharsets.UTF_8);
            JacksonXmlModule module = new JacksonXmlModule();
            module.setDefaultUseWrapper(false);

            XmlMapper xmlMapper = new XmlMapper(module);
            AgenteRequest agenteRequest = xmlMapper.readValue(fileContent, AgenteRequest.class);
            agenteRequest.getAgente().stream().forEach(agenteDto -> {
                Agente agente = agenteService.create(agenteDto);

                agenteDto.getRegiao().stream().forEach(regiaoDto -> {
                    regiaoService.create(agente , regiaoDto);
                });
            } );

            agenteRequest.getAgente().stream().forEach(agenteDto -> System.out.println(agenteDto.getCodigo()));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

/*
    @PostMapping(consumes = "application/xml", produces = "application/xml; charset=utf-8")
    public ResponseEntity<List<br.org.ccee.upload.model.Agente>> create(@RequestBody Agentes agentes)  {
       for (Agente novoAgente: agentes.getAgente()) {
            br.org.ccee.upload.model.Agente agente = agenteService.create(novoAgente);
            if (agente == null) {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
        }

        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }*/

    /*
    @PutMapping(value = "/{agenteId}")
    public ResponseEntity<Agente> update(@PathVariable Integer agenteId, @RequestBody AgenteDto agenteDto) {
        Agente agente = agenteService.update(agenteId, agenteDto);
        if (agente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(agente, HttpStatus.OK);
    }

    @DeleteMapping(value = "/{agenteId}")
    public ResponseEntity<Boolean> deleteById(@PathVariable Integer agenteId) throws ValidationException {
        Boolean removido  = agenteService.deleteById(agenteId);
        if (removido.equals(Boolean.TRUE)) return new ResponseEntity<Boolean>(Boolean.TRUE, HttpStatus.OK);
        else  return new ResponseEntity<Boolean>(Boolean.FALSE, HttpStatus.NOT_FOUND);
    }

     */

}
