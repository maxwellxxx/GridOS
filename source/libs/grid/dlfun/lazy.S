/*
	��̬������ʱ�Ķ�̬���Ӻ���(Lazy linking).
	��faso �а�װ��ϵͳ�С�
*/
	.global so_lazy_link
	.extern lazy_get_symbole_by_id
so_lazy_link:
#if defined(__i386__)
	/*
		PLT�����˷���ID��ģ��ID�����ǲ��ҷ��ţ����ҵ��������ָ��ĵ�ַ
	*/
	call lazy_get_symbole_by_id
	addl $8		, %esp												/*��ԭPLTѹ���ֵ*/
	jmpl *%eax														/*���ý������ķ��ŵ�ַ*/
	
#elif defined(__mips__)
#warning "MIPS Lazy linking not implemented."
	jr $ra
#endif
	.size	so_lazy_link, .-so_lazy_link