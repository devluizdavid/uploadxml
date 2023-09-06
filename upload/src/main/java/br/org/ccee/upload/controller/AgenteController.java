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
                    regiaoService.create(agente, regiaoDto);
                });
            });

            agenteRequest.getAgente().stream().forEach(agenteDto -> System.out.println(agenteDto.getCodigo()));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
