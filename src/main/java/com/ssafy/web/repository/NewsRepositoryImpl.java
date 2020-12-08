package com.ssafy.web.repository;

import com.ssafy.web.dto.News;

import java.net.URL;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Repository
public class NewsRepositoryImpl implements NewsRepository{

	@Override
	public ArrayList<News> getContent(String url) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

		ArrayList<News> list = new ArrayList<News>();

		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document dom = builder.parse(new URL(url).openConnection().getInputStream());

			Element root = dom.getDocumentElement();

			NodeList items = root.getElementsByTagName("item");

			for (int i=0;i<items.getLength();i++){
				News check = new News();
				Node item = items.item(i);
				NodeList properties = item.getChildNodes();
				for (int j=0;j<properties.getLength();j++){
					Node property = properties.item(j);
					String name = property.getNodeName();
					if (name.equalsIgnoreCase("title")){
						check.setTitle(property.getFirstChild().getNodeValue());
					} else if (name.equalsIgnoreCase("link")){
						check.setLink(property.getFirstChild().getNodeValue());
					}
					else if (name.equalsIgnoreCase("description")){
						check.setDesc(property.getFirstChild().getNodeValue());
					}
					else if (name.equalsIgnoreCase("author")){
						check.setAuthor(property.getFirstChild().getNodeValue());
					}
					else if (name.equalsIgnoreCase("pubDate")){
						check.setDate(property.getFirstChild().getNodeValue());
					} 		
				}
				list.add(check);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
		return list;
	}

}
