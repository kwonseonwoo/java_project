package com.zero.project.controller;

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

import com.zero.project.model.Criteria;
import com.zero.project.model.PageDTO;
import com.zero.project.model.ProductVO;
import com.zero.project.service.AdminProductService;

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
		
		MultipartFile[] uploadFile = new MultipartFile[2];
		String[] fileName = new String[2];
		String[] fileName2 = new String[2];
		String[] extend	= new String[2];
		
		uploadFile = vo.getUploadFile();
		
		for(int i=0; i<2; i++) {
			if(!uploadFile[i].isEmpty()) {
				fileName[i] = uploadFile[i].getOriginalFilename();
				fileName[i] = fileName[i].substring(0, fileName[i].lastIndexOf("."));
				fileName2[i] = uploadFile[i].getOriginalFilename();
				
				extend[i] = fileName2[i].substring(fileName2[i].lastIndexOf(".")+1);
				
				fileName[i] = fileName[i] + "-" + UUID.randomUUID()+"."+extend[i];
				
				uploadFile[i].transferTo(new File("c:/upload/"+fileName[i]));
				
			}
		}
		
		vo.setProduct_img1(fileName[0]);
		vo.setProduct_img2(fileName[1]);

		
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
		
		MultipartFile[] uploadFile = new MultipartFile[2];
		String[] fileName = new String[2];
		String[] fileName2 = new String[2];
		String[] extend	= new String[2];
		
		uploadFile = vo.getUploadFile();
		
		for(int i=0; i<2; i++) {
			if(!uploadFile[i].isEmpty()) {
				fileName[i] = uploadFile[i].getOriginalFilename();
				fileName[i] = fileName[i].substring(0, fileName[i].lastIndexOf("."));
				fileName2[i] = uploadFile[i].getOriginalFilename();
				
				extend[i] = fileName2[i].substring(fileName2[i].lastIndexOf(".")+1);
				
				fileName[i] = fileName[i] + "-" + UUID.randomUUID()+"."+extend[i];
				
				uploadFile[i].transferTo(new File("c:/upload/"+fileName[i]));
				
				
			} 
		}
		
		if(fileName[0] != null) {
			vo.setProduct_img1(fileName[0]);
		}
		
		if(fileName[1] != null) {
			vo.setProduct_img2(fileName[1]);
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
