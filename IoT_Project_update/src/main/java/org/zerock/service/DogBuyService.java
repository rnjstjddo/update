package org.zerock.service;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyService {
	
	public void dogregister(DogBuyVO DogBuyVO);
	public void dogregister2(DogBuy2VO dog2BuyVO);

	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();


	
	public DogBuyVO get(Long bno);

	public boolean modify(DogBuyVO dog1List);

	public boolean remove(Long bno);

}
