class CreateEditables < ActiveRecord::Migration
  def change
    create_table :editables do |t|
      t.integer :page_id
      t.string :name
      t.text :text
    end

    contact_page_id = Page.where(name: "Contact").last.id
    Editable.create(name: "Contact - Phone Number", text: "815-679-6847", page_id: contact_page_id)
    Editable.create(name: "Contact - Email Address", text: "sidelinemktg@gmail.com", page_id: contact_page_id)
    Editable.create(name: "Location - Name", text: "Sideline Marketing", page_id: contact_page_id)
    Editable.create(name: "Location - Line 1", text: "1112 N. Front St.", page_id: contact_page_id)
    Editable.create(name: "Location - Line 2", text: "McHenry, IL 60050", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Sunday", text: "9:30am-7:30pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Monday", text: "9:30am-7:30pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Tuesday", text: "9:30am-7:30pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Wednesday", text: "9:30am-4:00pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Thursday", text: "9:30am-7:30pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Friday", text: "9:30am-7:30pm", page_id: contact_page_id)
    Editable.create(name: "Store Hours - Saturday", text: "9:30am-7:30pm", page_id: contact_page_id)

    home_page_id = Page.where(name: "Home").last.id
    Editable.create(name: "Description", text: "Sideline Marketing is a full service sports marketing agency. We represent many professional athletes in an effort to organize, support, and promote their charities, as well as supply a platform to increase their brand awareness.", page_id: home_page_id)
    Editable.create(name: "Paragraph - Left", text: "Our mission is to organize, support, and promote professional sports players in their effort to assist their communites in economic and charitable endeavors. We strive to achieve these goals with professional athletes through public speaking, personal appearances, and charitable foundations. Sideline Marketing is dedicated to futhering their philanthropic efforts with honesty and integrity.", page_id: home_page_id)
    Editable.create(name: "Paragraph - Right", text: "Our mission is to organize, support, and promote professional sports players in their effort to assist their communites in economic and charitable endeavors. We strive to achieve these goals with professional athletes through public speaking, personal appearances, and charitable foundations. Sideline Marketing is dedicated to futhering their philanthropic efforts with honesty and integrity.", page_id: home_page_id)
  end
end
