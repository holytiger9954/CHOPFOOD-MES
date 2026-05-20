package kr.or.chop.P15_workplace.dao;

import java.util.List;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P15_workplace.dto.WPDTO;
import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;

public interface GlogDAO {
	
	public List<GhpDTO> selectAllGhp (WPDTO wpDTO);
	public List<GhpDTO> selectAllGhpWh (WHDTO whDTO);
	public GhpDTO selectGhp (GhpDTO ghpDTO);
	
	public int insertGlog (GlogDTO glogDTO);
	public int updateGhpImg (GlogDTO glogDTO);
	
	public GlogDTO selectGlog (GlogDTO glogDTO);
	
	public int deleteGlog (GlogDTO glogDTO);
	
	public int updateGlog (GlogDTO glogDTO);

}
