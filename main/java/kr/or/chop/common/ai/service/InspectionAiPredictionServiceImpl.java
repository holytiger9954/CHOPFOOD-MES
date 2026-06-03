package kr.or.chop.common.ai.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictResponseDTO;

@Service
public class InspectionAiPredictionServiceImpl implements InspectionAiPredictionService {

    private static final String AI_SERVER_URL =
            "http://116.36.205.25:9007/predict/inspection";

    @Override
    public InspectionAiPredictResponseDTO predict(InspectionAiPredictRequestDTO requestDTO) {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<InspectionAiPredictRequestDTO> entity =
                new HttpEntity<InspectionAiPredictRequestDTO>(requestDTO, headers);

        RestTemplate restTemplate = new RestTemplate();

        return restTemplate.postForObject(
                AI_SERVER_URL,
                entity,
                InspectionAiPredictResponseDTO.class
        );
    }
}