package kr.or.chop.common.ai.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.IoAiPredictResponseDTO;

@Service
public class IoAiPredictionServiceImpl implements IoAiPredictionService {

	private static final String AI_SERVER_URL = "http://116.36.205.25:9007/predict/io";

	@Override
	public IoAiPredictResponseDTO predict(IoAiPredictRequestDTO requestDTO) {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<IoAiPredictRequestDTO> entity = new HttpEntity<IoAiPredictRequestDTO>(requestDTO, headers);

		RestTemplate restTemplate = new RestTemplate();

		return restTemplate.postForObject(AI_SERVER_URL, entity, IoAiPredictResponseDTO.class);
	}
}