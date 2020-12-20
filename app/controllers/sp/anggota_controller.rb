class Sp::AnggotaController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan

  def index
    @datas = Anggotum.all
  end

  # def search
  #   anggota_id = params[:anggota_id].to_i
  #   @data = Anggotum.where("anggota_nama LIKE ?", "%" + params[:q] + "%")
  # end

  def baru
    @data = Anggotum.new
  end

  def baru_post
    anggota = params[:anggotum]

    Anggotum.create({
      anggota_nama: anggota[:anggota_nama],
      anggota_tgllahir: anggota[:anggota_tgllahir],
      anggota_alamat: anggota[:anggota_alamat],
      anggota_jk: anggota[:anggota_jk]
      })

      redirect_to action: 'index'
  end

  def edit
    anggota_id = params[:anggota_id].to_i
    @data = Anggotum.find(anggota_id)
  end

  def edit_post
    anggota = params[:anggotum]
    @data = Anggotum.find(params[:anggota_id])
    @data.anggota_nama = anggota[:anggota_nama]
    @data.anggota_tgllahir = anggota[:anggota_tgllahir]
    @data.anggota_alamat = anggota[:anggota_alamat]
    @data.anggota_jk = anggota[:anggota_jk]

    if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
  end

  def view
    anggota = params[:anggotum]
    @data = Anggotum.find(params[:anggota_id])
  end

  def hapus
     if Anggotum.find(params[:anggota_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

   private
def atur_tampilan
  @judul_halaman = "Data Anggota"
end

end
