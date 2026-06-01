package kr.or.chop.common.ai.service;

import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.IoAiPredictResponseDTO;

public interface IoAiPredictionService {

    IoAiPredictResponseDTO predict(IoAiPredictRequestDTO requestDTO);
}