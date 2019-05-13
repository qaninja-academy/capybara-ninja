describe "Upload", :upload do
  before(:each) do
    visit "/upload"
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/imagem.png"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo)
    click_button "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  it "upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)
    click_button "Upload"

    img = find("#new-image")
    expect(img[:src]).to include "/uploads/imagem.png"
  end
end
