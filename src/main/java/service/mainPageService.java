package service;

import java.util.List;

import dto.CatDTO;
import dto.CatUserDTO;

public interface mainPageService {
	public List<CatUserDTO> songProcess(CatUserDTO dto);

	public List<CatDTO> songyjProcess(CatDTO dto);

}
