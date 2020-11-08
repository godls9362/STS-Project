package com.human93.dotori00;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human93.VO.BCommentVO;
import com.human93.VO.BoardVO;
import com.human93.VO.MemberVO;
import com.human93.VO.PageVO;
import com.human93.service.dotoriService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
public class dotoriController {
	@Autowired
	dotoriService service;

	// <<<<<<<<<<<ȸ������
	@ResponseBody
	@RequestMapping(value = "/ID_Check", method = RequestMethod.POST)
	public String id_chk(Locale locale, Model model, @RequestBody String paramData) throws ParseException {
		String ID = paramData.trim();
		MemberVO vo = service.check_id(ID);
		System.out.println(ID);
		if (vo == null) {// ��� ���� ������ ���̵� ����
			System.out.println(vo);
			return "-1";
		} else { // ������ ���̵� ���� X
			System.out.println("null�ƴ�");
			return "0";
		}
	}

	@RequestMapping(value = "/insertRegi", method = RequestMethod.POST)
	public String insertOne(Locale locale, Model model, MemberVO vo) {
		service.insertOne(vo);
		return "index";
	}

	// >>>>>>>>>>>>>>>>ȸ������ ��
	// <<<<<<<<<<<<<<<<�Խ��ǰ���
	@RequestMapping(value = "/GoFBoard")
	public String bSelectAll(Locale locale, Model model) { // �Խ��� ��ü����
		model.addAttribute("blist", service.bselectAll());
		return "list";
	}

	@RequestMapping(value = "/writeGO", method = RequestMethod.GET)
	public String bgowritingMode(Locale locale, Model model) { // �۾���ȭ������ gogo!(��������������)
		String seq = service.bgetSeq();
		model.addAttribute("seq", seq);
		return "write";
	}

	@RequestMapping(value = "/savePost", method = RequestMethod.POST)
	public String bInsertOne(Locale locale, Model model, BoardVO vo) { // �� ��Ͼ�!
		service.binsert(vo);
		return "redirect:/GoFBoard";
	}

	@RequestMapping(value = "/goDetail", method = RequestMethod.GET)
	public String bgoDetail(Locale locale, Model model, @RequestParam("no") String no) {
		BoardVO vo = service.bselectOne(no);
		model.addAttribute("vo", vo);
		return "write_temp";
	}

	@ResponseBody
	@RequestMapping(value = "/goDelete")
	public String bgoDelete(Locale locale, Model model, @RequestParam("oNo") String no) throws ParseException {
		BoardVO vo=new BoardVO();
		vo.setNo(no);
		service.bdeleteOne(vo);
		return "1";
	}

	@RequestMapping(value = "/goUPpage", method = RequestMethod.POST)
	public String bgoUpdate(Locale locale, Model model, @RequestParam("no") String no) {
		BoardVO vo = service.bselectOne(no);
		model.addAttribute("vo", vo);
		return "update";
	}

	@RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
	public String bdoUpdate(Locale locale, Model model, BoardVO vo) {
		service.bupdateOne(vo);
		return "redirect:/GoFBoard";
	}

	// >>>>>>>>>>>>>>>>�Խ��ǰ��� ��
	// <<<<<<<<<<<<<<<<��� ����
	@ResponseBody
	@RequestMapping(value = "/insertBC", method = RequestMethod.POST) // ��� �ۼ�
	private String mCommentServiceInsert(@RequestParam String Bno, @RequestParam String Ccontent,
			@RequestParam String Cwriter) throws Exception {

		BCommentVO comment = new BCommentVO();
		comment.setBno(Bno);
		comment.setCContent(Ccontent);
		comment.setCWriter(Cwriter);

		return String.valueOf(service.CommentIn(comment));
	}

	@RequestMapping("/BCAllist") // ��� ����Ʈ
	@ResponseBody
	public ArrayList<BCommentVO> mCommentServiceList(Model model, @RequestParam String Bno) throws Exception {
		ArrayList<BCommentVO> temp = service.selectBC(Bno);
		return temp;
	}

	@RequestMapping("/deleteBC") // ��� ����Ʈ
	@ResponseBody
	public int deleteBCONE(Model model, @RequestParam String aa) throws Exception {
		System.out.println(aa);
		return service.deleteONEBC(aa);
	}

	// ��� ���ھƾƾƾ�~~~~~~~~~~~~~~~~~~~~~~~~~~
	@RequestMapping(value = "/Goreply")
	public String goReplymen(Locale locale, Model model, @RequestParam String originNo, @RequestParam String title,
			@RequestParam String grouplayer, @RequestParam String groupord) {
		model.addAttribute("ortitle", title);
		model.addAttribute("originNo", originNo);
		model.addAttribute("orgroupLayer", grouplayer);
		model.addAttribute("groupord", groupord);
		String seq = service.bgetSeq();
		model.addAttribute("seq", seq);
		return "reply";
	}

	@ResponseBody
	@RequestMapping(value = "/insertBoardReply", method = RequestMethod.POST)
	public String goInsertrly(Locale locale, Model model, @RequestParam String no, @RequestParam String originNo,
			@RequestParam String writer, @RequestParam String content, @RequestParam String title,
			@RequestParam String ortitle, @RequestParam String orgroupLayer, @RequestParam String groupord)
			throws Exception {
		BoardVO vo = new BoardVO();
		if (ortitle.contains("RE")) { // ����� ���
			vo.setTitle("RE:" + title);
			vo.setGroupOrd(Integer.valueOf(groupord)+1);
			service.anotherRlyUp(vo.getGroupOrd());
			vo.setGroupLayer(Integer.valueOf(orgroupLayer) + 1);
			vo.setContent(content);
			vo.setNo(no);
			vo.setWriter(writer);
			vo.setOriginNo(originNo);
		} else {
			vo.setTitle(title);
			vo.setGroupLayer(Integer.valueOf(orgroupLayer) + 1);
			vo.setContent(content);
			vo.setGroupOrd(Integer.valueOf(groupord)+1);
			service.anotherRlyUp(vo.getGroupOrd());
			vo.setNo(no);
			vo.setWriter(writer);
			vo.setOriginNo(originNo);
		}
		return String.valueOf(service.saveRly(vo));
	}

}
