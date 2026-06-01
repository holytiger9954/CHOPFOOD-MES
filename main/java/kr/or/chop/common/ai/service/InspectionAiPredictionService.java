package kr.or.chop.common.ai.service;

import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictResponseDTO;

public interface InspectionAiPredictionService {

    InspectionAiPredictResponseDTO predict(InspectionAiPredictRequestDTO requestDTO);
}