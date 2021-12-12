package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyMapper {

	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();

	public Integer doginsert(DogBuyVO dogBuyVO);
	public Integer doginsert2(DogBuy2VO dog2BuyVO);
	

	public void insert(DogBuyVO dog1List);

	public DogBuyVO read(Long bno);

	public int delete(Long bno);

	public int update(DogBuyVO dog1List);

}
