require "rails_helper"

describe 'GET /blogs', type: :request do
  let!(:blog) {FactoryGirl.create(:blog) }
  let(:path) { "/blogs" }

  it '200 OK が返ってくる' do
    get path, blog
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
end

describe 'POST /blogs', type: :request do
  let(:path) { '/blogs' }
  let(:params) { FactoryGirl.attributes_for(:blog).to_json }
  let(:request_header) do
    { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  it '201 created が返ってくる' do
    post path, params, request_header
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(response.status).to eq(201)
  end
end

describe 'PUT /blogs/{blog_id}', type: :request do
  let!(:blog) { FactoryGirl.create(:blog) }
  let(:path) { "/blogs/#{blog.id}" }
  let(:params) { FactoryGirl.attributes_for(:blog, title: "タイトル変更",
                                            content: "ブログ内容変更").to_json }
  let(:request_header) do
    { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json', 'AUTHORIZATION' => 'Token FOOVP' }
  end

  it '200 OK が返ってくる' do
    put path, params, request_header
    jsonz = JSON.parse(response.body)
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
end

describe 'DELETE /blogs/{blog_id}', type: :request do
  let!(:blog) { FactoryGirl.create(:blog) }
  let(:path) { "/blogs/#{blog.id}" }
  let(:request_header) do
    { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json', 'AUTHORIZATION' => 'Token FOOVP' }
  end

  it '204 NoContent が返ってくる' do
    delete path, request_header
    expect(response).to be_success
    expect(response.status).to eq(204)
  end
end