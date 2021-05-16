package Form;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class DoiMatKhau {

    @FXML
    private TextField tf_TaiKhoan;

    @FXML
    private TextField tf_MatKhauCu;

    @FXML
    private TextField tf_MatKhauMoi;

    @FXML
    private TextField tf_NhapLaiMatKhauMoi;

    @FXML
    private Button bt_XacNhan;

    @FXML
    private Button bt_Thoat;

    @FXML
    void Click_bt_Thoat(MouseEvent event) {
        System.exit(0);
    }

    @FXML
    void Click_bt_XacNhan(MouseEvent event) {

    }
}