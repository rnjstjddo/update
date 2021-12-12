package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;
import org.zerock.service.DogBuyService;
import org.zerock.service.DogInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class DogInfoController {
	
	private DogInfoService service;

	private DogBuyService buyservice;
		
	
	
	@GetMapping("/dogregister")
	public void dogregisterget() {

		log.info("GetMapping dogregister 등록화면");

	}
	
//	
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("register");
//		model.addAttribute("register", service.getList());
//	}

	@PostMapping("/dogremove") // dogdetail 에서 삭제 버튼 클리시처리시 여기로 온다.
	public String dogdetailpost(@RequestParam("dno") Long dno, RedirectAttributes rttr) {
		// remove는 GET방식으로 이동해서 remove.jsp로 화면을 새로 만들지 않기에 Model 객체가 필요없다.
		// 대신 RedirectAttributes 객체의 addFlashAttributes 속성을 이용한다.
		// service.get(dno);
		log.info("삭제 등록글번호"+dno);
		log.info("PostMapping remove 등록글삭제 POST방식 -> 목록으로 redirect");	

		// rttr.addFlashAttribute("{detail}",service.remove(dno));

		if (service.remove(dno)) {
			rttr.addFlashAttribute("remove", "처리가 완료되었습니다.");
		}

		return "redirect:/doglist"; // void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET 이동이므로.
	}

	@GetMapping("/dogdetail") // list에서 상세보기 버튼 클릭시 여기로 이동한다. <a>태그로 url dno 가지고 이동.
	public void dogdetailget(@RequestParam("dno") Long dno, Model model) {

		// service.get(dno);
		log.info(dno);
		log.info("PostMapping dogdetail 세부사항GET ->Controller 통해서 세부사항GET이동");	

		model.addAttribute("detail", service.get(dno));
		// return "redirect:/dogdetail"; void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET
		// 이동이므로.
	}

	@PostMapping("/dogdetail") // list에서 상세보기 버튼 클릭시 여기로 이동한다.POST방식의 FORM 전송 hidden 으로 dno 전달.
	public String dogdetailpost(@RequestParam("dno") Long dno, Model model) {

		// service.get(dno);
		log.info(dno);
		log.info("PostMapping dogdetail");

		model.addAttribute("detail", service.get(dno));
		// return "redirect:/dogdetail"; void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET
		// 이동이므로.
		return "redirect:/dogdetail";
	}

	@PostMapping("/dogregister")
	// public String dogregisterpost(DogInfoDTO dogInfoDTO, RedirectAttributes rttr)
	// {
	public String dogregisterpost(DogInfoDTO dogInfoDTO, @RequestParam ("uploadfileName") MultipartFile uploadfileName) throws IOException {	
		log.info("PostMapping dogregister 분양등록 POST 방식 Controlle로 들어옴");	
		String path = "C:\\upload\\";
		
		
		
		System.out.println("uploadfileName" + uploadfileName);
		
		String originfileName =uploadfileName.getOriginalFilename();
		//MultipartFile originfileName =uploadfileName.getOriginalFilename(); MultipartFile 로 객체선언시 에러발생
		//MultipartFile originfileName = dogInfoDTO.getUploadfileName();
		//
		
		//String extension =FilenameUtils.getExtension(originfileName); // 확장자만 구하기 굳이 이걸왜 써야하는지
		UUID uuid = UUID.randomUUID(); // UUID 구하기 fileName = uuid + "." + ext;
	
		String savefileName = uuid+originfileName;
		File saveFile = new File(path, savefileName);
	
		if(saveFile.exists() == false ) {
			saveFile.mkdirs();
		}
		
		uploadfileName.transferTo(saveFile); //업로드한 파일을 특정한 파일로 저장하고 싶을때
		//MultipartFile 객체를 transferTo 해줘야 오류나지 않는다.
	
		System.out.println(saveFile);

		
		dogInfoDTO.setFileName(savefileName);
		//FileName 에는 String타입이 와야하는데 File타입인 saveFile 들어오면 에러발생, DTO에서 타입을 String으로 지정.
		service.register(dogInfoDTO);
		
		log.info(dogInfoDTO);
		/*
		 * if (!uploadfileName.isEmpty()) { System.out.println(uploadfileName);
		 * 
		 * String originalFileName = uploadfileName.getOriginalFilename(); String ext =
		 * FilenameUtils.getExtension(originalFileName); // 확장자 구하기 UUID uuid =
		 * UUID.randomUUID(); // UUID 구하기 fileName = uuid + "." + ext;
		 * uploadfileName.transferTo(new File("D:\\upload\\" + fileName)); }
		 */
		
		// rttr.addFlashAttribute("registerdno",dogInfoDTO.getDno());
		return "redirect:/doglist";
	}

	@GetMapping("/doglist") // URI 입력시 분양리스트 화면만 보여준다.
	public void doglistget(Model model) {

		log.info("GetMapping doglist 목록화면GET");
		log.info(service.getList());
		model.addAttribute("registerdno", service.getList()); // 화면에는 register 이용해서 DB 내용가지고 온다.
	}
	
	@PostMapping("/cart") // URI 입력시 분양리스트 화면만 보여준다.
	//public void dogcartpost(@RequestParam("dno") Long dno, Model model) {
	public String cartpost(DogBuyVO dogBuyVO) {
	 	buyservice.dogregister(dogBuyVO);
		// service.get(dno);
		
		log.info("doglist 페이지에서 장바구니 등록 ");	

		//model.addAttribute("dog2List", buyservice.dogregister(dogBuyVO));
		return "redirect:/dogcart";
		// return "redirect:/dogdetail"; void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET
		// 이동이므로.
	}
	
	
	
//	@PostMapping(value="/doglist2", consumes ="application/json", produces= {MediaType.TEXT_PLAIN_VALUE}) 
//	// 분양목록에서 상세보기 버튼시 ajax 이용해서 post 전송
//	public ResponseEntity<String> doglistpost(@RequestBody Buy1VO buy1VO ){
//		buyservice.register1(buy1VO);
//		log.info("GetMapping doglist2 목록화면GET");
//
//		//return insertCount ==1
//		//? new ReponseEntity<> ("success", HttpStatus.OK)
//		//: new ReponseEitity<> ("HttpStatus.INTERNAL_SERVER_ERROR");
//		//return  new ResponseEntity<>("success", HttpStatus.OK); 
//	}
	
}
