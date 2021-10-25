package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.domain.ProductVO;
import com.spring.service.AdminProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminProductController {

	@Setter(onMethod_ = @Autowired)
	private AdminProductService service;
	
	@RequestMapping("/product/list")
	public void list(Model model, Criteria cri) {
		
		model.addAttribute("list", service.getListWithPaging(cri));
		
		int total = service.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/product/register")
	public void register() {
		
	}
	
	@PostMapping("/product/register")
	public String register(ProductVO vo) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			
			fileName=fileName.substring(0, fileName.lastIndexOf("."));
			String fileName2 = uploadFile.getOriginalFilename();
			
			String extend = fileName2.substring(fileName2.lastIndexOf(".")+1);
			
			fileName = fileName + "-" + UUID.randomUUID()+"."+extend;
			
			uploadFile.transferTo(new File("c:/upload/"+fileName));
			vo.setProduct_img(fileName);
		}
		
		service.register(vo);
		
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping("/product/view")
	public void view(int product_no, Model model) {
		
		ProductVO vo = service.getProduct(product_no);
		
		model.addAttribute("product", vo);
	}
	
	@RequestMapping("/product/modify")
	public String modify(ProductVO vo) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			
			fileName=fileName.substring(0, fileName.lastIndexOf("."));
			String fileName2 = uploadFile.getOriginalFilename();
			
			String extend = fileName2.substring(fileName2.lastIndexOf(".")+1);
			
			fileName = fileName + "-" + UUID.randomUUID()+"."+extend;
			
			uploadFile.transferTo(new File("c:/upload/"+fileName));
			vo.setProduct_img(fileName);
		
		} else {
			vo.setProduct_img(vo.getDef_img());
		}
		
		service.modify(vo);
		
		return "redirect:/admin/product/list";
		
	}
	
	@RequestMapping("/product/remove")
	public String remove(int product_no) {
		
		service.remove(product_no);
		
		return "redirect:/admin/product/list";
	}
	
}
