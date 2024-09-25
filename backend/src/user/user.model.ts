import { Column, DataType, Model, Table } from 'sequelize-typescript';

@Table({
  tableName: 'utilisateur',
})
export class User extends Model<User> {
  @Column({
    type: DataType.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'id_utilisateur',
  })
  id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    field: 'nom',
  })
  nom: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    field: 'prenom',
  })
  prenom: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
    field: 'id_discord',
  })
  id_discord: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
    field: 'mail_espi',
  })
  mail_epsi: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    field: 'password',
  })
  password: string;

  // @ForeignKey(() => Role)
  // @Column({
  //   type: DataType.INTEGER,
  //   allowNull: false,
  //   field: 'role_id_role',
  // })
  // roleId: number;
  //
  // @ForeignKey(() => Statut)
  // @Column({
  //   type: DataType.INTEGER,
  //   allowNull: false,
  //   field: 'statut_id_statut',
  // })
  // statutId: number;
}
