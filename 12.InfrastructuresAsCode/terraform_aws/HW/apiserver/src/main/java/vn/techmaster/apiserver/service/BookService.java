package vn.techmaster.apiserver.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.techmaster.apiserver.model.Book;

@Service
public class BookService {

  public List<Book> listBooks() {
    return  List.of(
      new Book("1", "Gone with the wind", "Margaret Mitchell", 1936),
      new Book("2", "Dế Mèn Phiêu Lưu Ký", "Tô Hoài", 1941),
      new Book("3", "Sông Đông êm đềm", "Mikhail Aleksandrovich Sholokhov. ", 1925)
    );
  }
}
