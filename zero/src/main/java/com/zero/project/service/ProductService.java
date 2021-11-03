package com.zero.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.project.model.Member;
import com.zero.project.model.Product;
import com.zero.project.repository.MemberRepository;
import com.zero.project.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;

	
	@Transactional
	public void buy(Product product) {
		Product pro = productRepository.findById(product.getProduct_no()).orElseThrow(()-> {
			return new IllegalArgumentException("상품 찾기 실패");
		});
		int pro_increase = pro.getSale_count() + 1;
		pro.setSale_count(pro_increase);
	}
	
	
	

	
	

}
