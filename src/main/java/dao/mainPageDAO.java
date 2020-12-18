package dao;

import java.util.List;

import dto.CatDTO;
import dto.CatUserDTO;

public interface mainPageDAO {

	public List<CatUserDTO> songMethod(CatUserDTO dto);

	public List<CatDTO> songyjMethod(CatDTO dto);
}
