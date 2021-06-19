* Settings *
Documentation           Aqui estarão presentes todas as Keywords dos testes de API.

Library                 RequestsLibrary
Library                 Collections

* Variables *
${URL_API}         https://fakerestapi.azurewebsites.net/api/v1

&{JSON_POST}
...     id=201
...     title=Meu novo Book
...     description=Estamos testando a adição de novos livros
...     pageCount=556
...     excerpt=Esse livro é muito top
...     publishDate=2021-06-18T23:12:00.5639338+00:00

* Keywords *
Conectar a minha API
  Create Session      fakeAPI         ${URL_API}            disable_warnings=${True}
  ${HEADERS}          Create Dictionary                   content-type=application/json
  Set Suite Variable                  ${HEADERS}

Requisitar todos os livros
  ${RESPOSTA}         Get On Session   fakeAPI    Books    expected_status=any
  Log                                 ${RESPOSTA.text}
  Set Test Variable                   ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
  Create Session     fakeAPI          ${URL_API}     disable_warnings=${True}
  ${HEADERS}         Create Dictionary       content-type=application/json
  Set Suite Variable                  ${HEADERS}
  ${RESPOSTA}        Get On Session   fakeAPI         Books/${ID_LIVRO}    expected_status=any
  Log                                 ${RESPOSTA.text}
  Set Test Variable                   ${RESPOSTA}

Cadastrar um novo livro
  Set Suite Variable                  ${JSON_BODY}            ${JSON_POST}
  ${RESPOSTA}                         Post On Session         fakeAPI         Books
  ...                                 json=${JSON_BODY}
  ...                                 headers=${HEADERS}      expected_status=any
  Log                                 ${RESPOSTA.text}
  Set Test Variable                   ${RESPOSTA}

Alterar o livro "${ID_LIVRO}"
  Set Suite Variable                  ${JSON_BODY}            ${JSON_POST}
  ${RESPOSTA}                         Put On Session          fakeAPI         Books/${ID_LIVRO}
  ...                                 json=${JSON_BODY}
  ...                                 headers=${HEADERS}      expected_status=any
  Log                                 ${RESPOSTA.text}
  Set Test Variable                   ${RESPOSTA}

Excluir o livro "${ID_LIVRO}"
  ${RESPOSTA}                         Delete On Session       fakeAPI         Books/${ID_LIVRO}
  Log                                 ${RESPOSTA.text}
  Set Test Variable                   ${RESPOSTA}

Conferir o status code      
  [Arguments]                         ${STATUSCODE_DESEJADO}
  Should Be Equal As Strings          ${RESPOSTA.status_code}               ${STATUSCODE_DESEJADO}

Conferir o reason
  [Arguments]                         ${REASON_DESEJADO}
  Should Be Equal As Strings          ${RESPOSTA.reason}                    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
  Length Should Be                    ${RESPOSTA.json()}                    ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro "${ID_LIVRO}"
  Dictionary Should Contain Item      ${RESPOSTA.json()}      id            20
  Dictionary Should Contain Item      ${RESPOSTA.json()}      title         Book 20
  Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount     2000
  Should Not Be Empty                 ${RESPOSTA.json()["description"]}
  Should Not Be Empty                 ${RESPOSTA.json()["excerpt"]}
  Should Not Be Empty                 ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados do livro "${ID_LIVRO}"
  Dictionary Should Contain Item      ${RESPOSTA.json()}      id              ${JSON_POST.id}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      title           ${JSON_POST.title}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      description     ${JSON_POST.description}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount       ${JSON_POST.pageCount}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      excerpt         ${JSON_POST.excerpt}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      publishDate     ${JSON_POST.publishDate}

Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
  Dictionary Should Contain Item      ${RESPOSTA.json()}      id              ${JSON_POST.id}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      title           ${JSON_POST.title}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      description     ${JSON_POST.description}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount       ${JSON_POST.pageCount}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      excerpt         ${JSON_POST.excerpt}
  Dictionary Should Contain Item      ${RESPOSTA.json()}      publishDate     ${JSON_POST.publishDate}

Conferir se excluiu o livro "${ID_LIVRO}"
  Should Be Empty                     ${RESPOSTA.content}
