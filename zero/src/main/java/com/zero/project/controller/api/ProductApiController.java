package com.zero.project.controller.api;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.config.auth.PrincipalDetail;
import com.zero.project.dto.ResponseDto;
import com.zero.project.model.Member;
import com.zero.project.model.Product;
import com.zero.project.repository.MemberRepository;
import com.zero.project.service.MemberService;
import com.zero.project.service.ProductService;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class ProductApiController {
	
	private ProductService productService;

	@PutMapping("/product")
	public ResponseDto<Integer> buy(@RequestBody Product product) {
		productService.buy(product);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}
