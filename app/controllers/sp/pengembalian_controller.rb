class Sp::PengembalianController < ApplicationController
  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan

  def index
    @datas = Pengembalian.all
  end

  def baru
    @data = Pengembalian.new
  end

  def baru_post
    pengembalian = params[:pengembalian]

    Pengembalian.create({
      pengembalian_idpinjam: pengembalian[:pengembalian_idpinjam],
      pengembalian_tanggal: pengembalian[:pengembalian_tanggal],
      pengembalian_denda: pengembalian[:pengembalian_denda]

      })

      redirect_to action: 'index'
  end

  def edit
    pengembalian_id = params[:pengembalian_id].to_i
    @data = Pengembalian.find(pengembalian_id)
  end

  def edit_post
    pengembalian = params[:pengembalian]
    @data = Pengembalian.find(params[:pengembalian_id])
    @data.pengembalian_idpinjam = pengembalian[:pengembalian_idpinjam]
    @data.pengembalian_tanggal = pengembalian[:pengembalian_tanggal]
    @data.pengembalian_denda = pengembalian[:pengembalian_denda]

    if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
  end

  def view
    pengembalian = params[:pengembalian]
    @data = Pengembalian.find(params[:pengembalian_id])
  end

  def hapus
     if Pengembalian.find(params[:pengembalian_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

   private
def atur_tampilan
  @judul_halaman = "Data pengembalian"
end

end
