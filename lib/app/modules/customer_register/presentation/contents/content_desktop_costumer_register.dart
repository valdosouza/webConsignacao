import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:flutter/material.dart';

class ContentDesktopCostumerRegister extends StatefulWidget {
  const ContentDesktopCostumerRegister({super.key});

  @override
  State<ContentDesktopCostumerRegister> createState() =>
      _ContentDesktopCostumerRegisterState();
}

class _ContentDesktopCostumerRegisterState
    extends State<ContentDesktopCostumerRegister> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSearchInput(),
              const SizedBox(height: 30.0),
              Expanded(
                child:
                    // stocklists.isEmpty
                    //     ? const Center(
                    //         child: Text(
                    //             "Não encontramos nenhum registro em nossa base."))
                    //     :
                    ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Text((index + 1).toString()),
                        ),
                      ),
                      title: const Text("Teste"),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          CustomToast.showToast(
                              "Funcionalidade em desenvolvimento.");
                        },
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: true,
        onChanged: (value) {},
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise seu cliente por nome, cnpj ou cpf",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
