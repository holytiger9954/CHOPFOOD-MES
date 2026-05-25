package kr.or.chop.P22_ai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import kr.or.chop.P22_ai.dto.AiInsightDTO;
import kr.or.chop.P22_ai.dto.AiPredictHistoryDTO;
import kr.or.chop.P22_ai.dto.AiPredictResponseDTO;
import kr.or.chop.P22_ai.dto.AiQualityDTO;
import kr.or.chop.P22_ai.dto.AiRiskChartDTO;
import kr.or.chop.P22_ai.dto.AiSummaryDTO;
import kr.or.chop.P22_ai.service.AiService;

@Controller
@RequestMapping("/ai")
public class AiController {

	@Autowired
	private AiService aiService;

	@RequestMapping("/dashboard")
	public String aiDashboard(Model model) {

		AiSummaryDTO summary = aiService.selectAiSummary();

		List<AiRiskChartDTO> riskChart = aiService.selectRiskChartData();

		AiInsightDTO insight = aiService.selectAiInsight();

		List<AiPredictHistoryDTO> recentHistory = aiService.selectRecentPredictHistory();

		model.addAttribute("summary", summary);
		model.addAttribute("riskChart", riskChart);
		model.addAttribute("insight", insight);
		model.addAttribute("recentHistory", recentHistory);

		return "P22_ai/aiDashboard.tiles";
	}

	@RequestMapping("/quality")
	public String aiQualityReport(Model model) {

		List<AiQualityDTO> aiList = aiService.selectAiQualityList();

		model.addAttribute("aiList", aiList);

		return "P22_ai/aiQualityReport.tiles";
	}

	@RequestMapping("/predict-test")
	public String predictTest(Model model) {

		String url = "http://192.168.0.50:8000/predict";

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, Object> request = new HashMap<String, Object>();

		request.put("prod_qty", 1800);
		request.put("temperature", 35.5);
		request.put("humidity", 88.0);
		request.put("equipment_runtime", 25);
		request.put("work_shift_num", 1);

		HttpEntity<Map<String, Object>> entity = new HttpEntity<Map<String, Object>>(request, headers);

		AiPredictResponseDTO response = restTemplate.postForObject(url, entity, AiPredictResponseDTO.class);

		model.addAttribute("predictResult", response.getRisk());

		return "P22_ai/predictResult.tiles";
	}

	@RequestMapping("/predict-form")
	public String predictForm() {

		return "P22_ai/predictForm.tiles";
	}

	@RequestMapping("/predict")
	public String predict(int prodQty, double temperature, double humidity, int equipmentRuntime, int workShiftNum,
			Model model) {

		String url = "http://192.168.0.50:8000/predict";

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, Object> request = new HashMap<String, Object>();

		request.put("prod_qty", prodQty);
		request.put("temperature", temperature);
		request.put("humidity", humidity);
		request.put("equipment_runtime", equipmentRuntime);
		request.put("work_shift_num", workShiftNum);

		HttpEntity<Map<String, Object>> entity = new HttpEntity<Map<String, Object>>(request, headers);

		AiPredictResponseDTO response = restTemplate.postForObject(url, entity, AiPredictResponseDTO.class);

		AiPredictHistoryDTO history = new AiPredictHistoryDTO();

		history.setProdQty(prodQty);
		history.setTemperature(temperature);
		history.setHumidity(humidity);
		history.setEquipmentRuntime(equipmentRuntime);
		history.setWorkShiftNum(workShiftNum);
		history.setRiskLevel(response.getRisk());

		aiService.insertPredictHistory(history);

		model.addAttribute("predictResult", response.getRisk());

		model.addAttribute("prodQty", prodQty);
		model.addAttribute("temperature", temperature);
		model.addAttribute("humidity", humidity);
		model.addAttribute("equipmentRuntime", equipmentRuntime);
		model.addAttribute("workShiftNum", workShiftNum);

		return "P22_ai/predictResult.tiles";
	}
}