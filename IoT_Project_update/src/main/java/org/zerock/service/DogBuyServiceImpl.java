package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;
import org.zerock.mapper.DogBuyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DogBuyServiceImpl implements DogBuyService{

	@Setter(onMethod_ = @Autowired)
	private DogBuyMapper dogBuymapper;

	@Override
	public void dogregister(DogBuyVO dogBuyVO) {
		dogBuymapper.doginsert(dogBuyVO);
	}
	@Override
	public void dogregister2(DogBuy2VO dog2BuyVO) {
		dogBuymapper.doginsert2(dog2BuyVO);
	}
	
	

	/* ============================================================= */
	
	@Override
	public List<DogInfoDTO> dog1List() {
		return dogBuymapper.dog1List();
	}

	@Override
	public List<DogBuyVO> dog2List() {
		return dogBuymapper.dog2List();
	}

	
	
	
	
	
	
	
	
	
	
	
	@Override
	public DogBuyVO get(Long bno) {
		return null;
	}

	@Override
	public boolean modify(DogBuyVO dog1List) {
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}
	

	

}
