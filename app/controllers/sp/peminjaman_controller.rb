class Sp::PeminjamanController < ApplicationController

  before_action :login_sp_required
  layout 'sp'
  before_action :set_databuku, :atur_tampilan

  def index
    @datas = Peminjaman.all
  end



  def baru
    @databuku = params[:databuku_id].to_i
    @data = Peminjaman.new

  end

  def baru_post
    peminjaman = params[:peminjaman]

    Peminjaman.create({
      databuku_id: peminjaman[:databuku_id],
      peminjaman_nama: peminjaman[:peminjaman_nama],
      peminjaman_buku: peminjaman[:peminjaman_buku],
      peminjaman_tglpinjam: peminjaman[:peminjaman_tglpinjam],
      peminjaman_tglkembali: peminjaman[:peminjaman_tglkembali],
      peminjaman_status: peminjaman[:peminjaman_status]
      })

      redirect_to action: 'index'
  end

  def edit
    peminjaman_id = params[:peminjaman_id].to_i
    @data = Peminjaman.find(peminjaman_id)
  end

  def edit_post
    peminjaman = params[:peminjaman]
    @data = Peminjaman.find(params[:peminjaman_id])
    @data.peminjaman_nama = peminjaman[:peminjaman_nama]
    @data.peminjaman_buku = peminjaman[:peminjaman_buku]
    @data.peminjaman_tglpinjam = peminjaman[:peminjaman_tglpinjam]
    @data.peminjaman_tglkembali = peminjaman[:peminjaman_tglkembali]
    @data.peminjaman_status = peminjaman[:peminjaman_status]

    if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
  end

  def view
    peminjaman = params[:peminjaman]
    @data = Peminjaman.find(params[:peminjaman_id])
  end

  def hapus
     if peminjaman.find(params[:peminjaman_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

  private
  def atur_tampilan
    @judul_halaman = "Data Peminjaman"
  end

  private
  def set_databuku
    @databuku = Databuku.all
  end


end
