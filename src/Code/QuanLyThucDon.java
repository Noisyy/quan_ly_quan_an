package Code;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class QuanLyThucDon {

    @FXML
    private Tab tab_QLLTD;

    @FXML
    private Tab tab_QLGM;

    @FXML
    private Tab tab_QLTD;

    @FXML
    private TextField tf_MaLoai_QLLTD;

    @FXML
    private TextField tf_TenLoai_QLLTD;

    @FXML
    private ChoiceBox<?> cb_TrangThai_QLLTD;

    @FXML
    private Button bt_Them_QLLTD;

    @FXML
    private Button bt_Xoa_QLLTD;

    @FXML
    private Button bt_Sua_QLLTD;

    @FXML
    private Button bt_Luu_QLLTD;

    @FXML
    private Button bt_Thoat_QLLTD;

    @FXML
    private TextField tf_MaTD_QLTD;

    @FXML
    private TextField tf_TenTD_QLTD;

    @FXML
    private ChoiceBox<?> cb_TrangThai_QLTD;

    @FXML
    private Button bt_Them_QLTD;

    @FXML
    private Button bt_Xoa_QLTD;

    @FXML
    private Button bt_Sua_QLTD;

    @FXML
    private Button bt_Luu_QLTD;

    @FXML
    private Button bt_Thoat_QLTD;

    @FXML
    private ChoiceBox<?> cb_LoaiTD_QLTD;

    @FXML
    private TextField tf_DonVi_QLTD;

    @FXML
    private TextField tf_SoLuongTon_QLTD;

    @FXML
    private TextField tf_DonGia_QLTD;

    @FXML
    private Button bt_Them_QLGM;

    @FXML
    private Button bt_Xoa_QLGM;

    @FXML
    private Button bt_Sua_QLGM;

    @FXML
    private Button bt_Luu_QLGM;

    @FXML
    private Button bt_Thoat_QLGM;

    @FXML
    private TextField tf_DonGia_QLGM;

    @FXML
    private ChoiceBox<?> cb_LoaiTD_QLGM;

    @FXML
    private ChoiceBox<?> cb_KhuVuc_QLGM;

    @FXML
    private ChoiceBox<?> cb_Ban_QLGM;

    @FXML
    private TextField tf_SoLuong_QLGM;

    public void AnHienNut_QLLTD(Boolean CongTac){
        bt_Luu_QLLTD.setVisible(CongTac);
        bt_Xoa_QLLTD.setVisible(CongTac);
        bt_Them_QLLTD.setVisible(CongTac);
        bt_Sua_QLLTD.setVisible(!CongTac);
    }
    
    public void AnHienNut_QLTD(Boolean CongTac){
        bt_Luu_QLTD.setVisible(CongTac);
        bt_Xoa_QLTD.setVisible(CongTac);
        bt_Them_QLTD.setVisible(CongTac);
        bt_Sua_QLTD.setVisible(!CongTac);
    }

        public void AnHienNut_QLGM(Boolean CongTac){
        bt_Luu_QLGM.setVisible(CongTac);
        bt_Xoa_QLGM.setVisible(CongTac);
        bt_Them_QLGM.setVisible(CongTac);
        bt_Sua_QLGM.setVisible(!CongTac);
    }

    @FXML
    void Click_bt_Luu_QLGM(MouseEvent event) {
        AnHienNut_QLGM(false);
    }

    @FXML
    void Click_bt_Luu_QLLTD(MouseEvent event) {
        AnHienNut_QLLTD(false);
    }

    @FXML
    void Click_bt_Luu_QLTD(MouseEvent event) {
        AnHienNut_QLTD(false);
    }

    @FXML
    void Click_bt_Sua_QLLTD(MouseEvent event) {
        AnHienNut_QLLTD(true);
    }

    @FXML
    void Click_bt_Sua_QLTD(MouseEvent event) {
        AnHienNut_QLTD(true);
    }

    @FXML
    void Click_bt_Sua_QLGM(MouseEvent event){
        AnHienNut_QLGM(true);
    }
    
    @FXML
    void Click_bt_Them_QLGM(MouseEvent event) {
        AnHienNut_QLGM(false);
    }

    @FXML
    void Click_bt_Them_QLLTD(MouseEvent event) {
        AnHienNut_QLLTD(false);
    }

    @FXML
    void Click_bt_Them_QLTD(MouseEvent event) {
        AnHienNut_QLTD(false);
    }

    @FXML
    void Click_bt_Thoat_QLGM(MouseEvent event) {
        AnHienNut_QLGM(false);
    }

    @FXML
    void Click_bt_Thoat_QLLTD(MouseEvent event) {
        AnHienNut_QLLTD(false);
    }

    @FXML
    void Click_bt_Thoat_QLTD(MouseEvent event) {
        AnHienNut_QLTD(false);
    }

    @FXML
    void Click_bt_Xoa_QLGM(MouseEvent event) {
        AnHienNut_QLGM(false);
    }

    @FXML
    void Click_bt_Xoa_QLLTD(MouseEvent event) {
        AnHienNut_QLLTD(false);
    }

    @FXML
    void Click_bt_Xoa_QLTD(MouseEvent event) {
        AnHienNut_QLTD(false);
    }

        @FXML
    void Selection_QLTD(ActionEvent event) {

    }

        @FXML
    void Selection_QLLTD(ActionEvent event) {

    }

        @FXML
    void Selection_QLGM(ActionEvent event) {

    }
}

