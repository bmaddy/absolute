class Oracle < ActiveRecord::Migration
  def change
    # Make changes so that table and sequence names are oracle compliant
    rename_table :mailboxer_conversation_opt_outs, :mailboxer_convers_opt_outs
    rename_index :featured_works, 'index_featured_works_on_generic_file_id', 'i_feat_works_generic_file_id'
    rename_index :mailboxer_convers_opt_outs, 'index_mailboxer_conversation_opt_outs_on_conversation_id', 'i_mail_con_opt_outs_convers_id'
    rename_index :mailboxer_convers_opt_outs, 'index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type', 'i_mail_con_opt_out_uns_id_type'
    rename_index :mailboxer_notifications, 'index_mailboxer_notifications_on_notified_object_id_and_type', 'i_mai_not_not_obj_id_type' 
    rename_index :mailboxer_notifications, 'index_mailboxer_notifications_on_sender_id_and_sender_type', 'i_mai_not_send_id_type'
    rename_index :mailboxer_notifications, 'index_mailboxer_notifications_on_type', 'i_mail_notifications_on_type'
    rename_index :mailboxer_receipts, 'index_mailboxer_receipts_on_receiver_id_and_receiver_type', 'i_mail_rec_receiver_id_type'
  end
end

